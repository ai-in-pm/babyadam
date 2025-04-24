# this is an example of how to use babyadam with custom routes

from babyadam import create_app, register_function

app = create_app('/dashboard')

@register_function()
def another_custom_function():
    return "Hello from another custom function!"

@app.route('/')
def home():
    return f"Welcome to the main app. Visit <a href=\"/dashboard\">/dashboard</a> for BabyAdam dashboard."

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
