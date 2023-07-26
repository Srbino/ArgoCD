from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/calculate', methods=['POST'])
def calculate():
    if request.method == 'POST':
        operation = request.form.get('operation')
        num1 = int(request.form.get('num1'))
        num2 = int(request.form.get('num2'))
        if operation == 'add':
            result = num1 + num2
        elif operation == 'subtract':
            result = num1 - num2
        elif operation == 'multiply':
            result = num1 * num2
        elif operation == 'divide':
            if num2 == 0:
                return "Error: Division by zero"
            result = num1 / num2
        else:
            return "Invalid operation"
        return render_template('home.html', result=result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
