import babyadam

@babyadam.register_function()
def function_a():
    print("Result from function A")
    return "Result from function A"

@babyadam.register_function(triggers=['function_a'])
def function_b(input_data):
    print(f"Function B triggered with input: {input_data}")
    return f"Function B triggered with input: {input_data}"

function_a()

@app.route('/')
def home():
    return f"Welcome to the main app. Visit <a href=\"/dashboard\">/dashboard</a> for BabyAdam dashboard."

if __name__ == "__main__":
    app = babyadam.create_app('/dashboard')
    app.run(host='0.0.0.0', port=8080)