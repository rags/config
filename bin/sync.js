#!node

var watch = require('node-watch');
var exec = require('child_process').exec;
var spawnSync = require('child_process').spawnSync;
var fs = require('fs');
var process = require('process');
var path = require('path');


function remotePath(filePath) {
    return path.resolve(filePath).replace(process.env["HOME"], dev +  ":" + "~");
}

function ws_root() {
    var cmd = spawnSync("brazil", ["ws","show"]);
    return /Root:\s+(.*)/.exec(cmd.stdout.toString())[1];
}

var ws_root = process.argv.length>2?process.argv[2]: ws_root();
var ws = path.join(ws_root, "src");
var dev = process.argv.length>3?process.argv[3] : "dev";
var destMap = {};
var packages = fs.readdirSync(ws).filter(function(file){return fs.statSync(path.join(ws, file)).isDirectory() && file.indexOf("FortuneCookie")>-1;}).map(function(file) {
    var fullPath =  path.resolve(path.join(ws,file));
    destMap[fullPath] = fullPath.replace(process.env["HOME"], dev +  ":" + "~");
    return fullPath;
});                               
                                  
console.log("Start sync on : \n");
for (var k in destMap) {          
    console.log(k + "  ->  " + destMap[k]);
}
console.log("-------------");
console.log(packages);
 watch(packages, 
       function(filename) {
           if(/\/\.|\/node_modules\/|\/lib\/|\/dist\/|\/build\//.test(filename)) {
               return;
           }
           console.log("change detected")
           var rsync = 'rsync -avz --delete --exclude "\\.*" --exclude dist --exclude build --exclude node_modules ';
           var exec_cmd = rsync + filename +  " " + remotePath(filename);
           console.log(exec_cmd);
           exec(exec_cmd,
                function(error, stdout, stderr) {
                    console.log(stdout);
                    if(error) {
                        console.error(error, stderr);
                    }
                    console.log('done deploying @ ' + new Date());
                });
       });


