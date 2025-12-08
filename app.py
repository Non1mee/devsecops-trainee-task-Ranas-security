from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/analyze', methods=['POST'])
def analyze():
    log_path = request.json.get('log_path', 'example.log')
    try:
        result = subprocess.run(['./log_checker.sh', log_path], capture_output=True, text=True)
        return jsonify({'output': result.stdout, 'code': result.returncode})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
raise Exception('Simulated failure')
