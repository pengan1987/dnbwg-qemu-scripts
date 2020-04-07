import subprocess
from flask import Flask
from flask import request
app = Flask(__name__)


@app.route('/')
def hello():
    return "Hello World!"

@app.route('/reset')
def resetVM():
    vmdict = {
        "red":"startred.sh",
	"blue":"startblue.sh",
	"xteam":"startxteam.sh",
	"happy":"starthappy.sh",
	"cle":"startcle.sh"
    }
    vmname = request.args.get('vmname')
    script = vmdict[vmname]
    if script:
	subprocess.call("./"+script, shell=True)
        return "VM \"" + vmname +"\" reset done!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=45000)

