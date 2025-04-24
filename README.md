# BabyAdam

![babyadamrobot](https://github.com/user-attachments/assets/eeeb7932-cc53-4135-ac18-ab40bea49fd4)

> [!NOTE]
> This project is a fork of the original BabyAGI project, renamed to BabyAdam (Applied Decision Architecture Matrix) and maintained by Darrell Mesa.

> [!CAUTION]
> This is an experimental framework. Not meant for production use. Use with caution.

---

BabyAdam (Applied Decision Architecture Matrix) is an experimental framework for a self-building autonomous agent focused on Narrow AI applications in specific domains. Rather than attempting to build a general AI system, BabyAdam focuses on creating specialized, domain-specific autonomous agents that excel at particular tasks.

## Domain Adaptability

BabyAdam is designed to adapt to any specific domain based on the end user's prompt. The framework analyzes the user's input and dynamically constructs domain-specific functions and workflows to address the particular needs of that domain. This allows BabyAdam to be versatile across various industries and use cases while maintaining the benefits of specialized, narrow AI applications.

## Specialized Domains

BabyAdam is particularly well-suited for applications in:

- **Project Management**: Task scheduling, resource allocation, risk management
- **Agile Methodology**: Sprint planning, backlog prioritization, velocity prediction
- **Earned Value Management**: EVM metrics calculation, variance analysis, forecasting
- **Project Controls**: Cost control, schedule management, performance analysis
- **Portfolio Management**: Portfolio optimization, investment selection, risk analysis
- **Program Management**: Benefits management, dependency management, governance
- **Performance Management**: Analytics, goal tracking, improvement planning

The core is a new function framework (**functionz**) for storing, managing, and executing functions from a database. It offers a graph-based structure for tracking imports, dependent functions, and authentication secrets, with automatic loading and comprehensive logging capabilities. Additionally, it comes with a dashboard for managing functions, running updates, and viewing logs.

## Table of Contents

- [Quick Start](#quick-start)
- [Basic Usage](#basic-usage)
- [Function Metadata](#function-metadata)
- [Function Loading](#function-loading)
- [Key Dependencies](#key-dependencies)
- [Execution Environment](#execution-environment)
  - [Log](#log)
- [Dashboard](#dashboard)
- [Pre-loaded Functions](#pre-loaded-functions)
- [Future/Draft Features](#futuredraft-features)
- [API Reference](#api-reference)
- [Contributing](#contributing)
- [License](#license)

## Quick Start

To quickly check out the dashboard and see how it works:

1. **Install BabyAdam:**

    ```bash
    pip install babyadam
    ```

2. **Import BabyAdam and load the dashboard:**

    ```python
    import babyadam

    if __name__ == "__main__":
        app = babyadam.create_app('/dashboard')
        app.run(host='0.0.0.0', port=8080)
    ```

3. **Navigate to the dashboard:**

    Open your browser and go to `http://localhost:8080/dashboard` to access the BabyAdam dashboard.

## Basic Usage

Start by importing `babyadam` and registering your functions. Here's how to register two functions, where one depends on the other:

```python
import babyadam

# Register a simple function
@babyadam.register_function()
def world():
    return "world"

# Register a function that depends on 'world'
@babyadam.register_function(dependencies=["world"])
def hello_world():
    x = world()
    return f"Hello {x}!"

# Execute the function
print(babyadam.hello_world())  # Output: Hello world!

if __name__ == "__main__":
    app = babyadam.create_app('/dashboard')
    app.run(host='0.0.0.0', port=8080)
```

## Function Metadata

Functions can be registered with metadata to enhance their capabilities and manage their relationships. Here's a more comprehensive example of function metadata, showing logical usage of all fields:

```python
import babyadam

@babyadam.register_function(
    imports=["math"],
    dependencies=["circle_area"],
    key_dependencies=["openai_api_key"],
    metadata={
        "description": "Calculates the volume of a cylinder using the circle_area function."
    }
)
def cylinder_volume(radius, height):
    import math
    area = circle_area(radius)
    return area * height
```

**Available Metadata Fields:**

- `imports`: List of external libraries the function depends on.
- `dependencies`: List of other functions this function depends on.
- `key_dependencies`: List of secret keys required by the function.
- `metadata["description"]`: A description of what the function does.

## Function Loading

In addition to using `register_function`, you can use `load_function` to load plugins or draft packs of functions. BabyAdam comes with built-in function packs, or you can load your own packs by pointing to the file path.

You can find available function packs in `babyadam/functionz/packs`.

**Loading Custom Function Packs:**

```python
import babyadam

# Load your custom function pack
babyadam.load_functions("path/to/your/custom_functions.py")
```

This approach makes function building and management easier by organizing related functions into packs.

## Key Dependencies

You can store `key_dependencies` directly from your code or manage them via the dashboard.

**Storing Key Dependencies from Code:**

```python
import babyadam

# Add a secret key
babyadam.add_key_wrapper('openai_api_key', 'your_openai_api_key')
```

**Adding Key Dependencies via Dashboard:**

Navigate to the dashboard and use the **add_key_wrapper** feature to securely add your secret keys.

## Execution Environment

BabyAdam automatically loads essential function packs and manages their dependencies, ensuring a seamless execution environment. Additionally, it logs all activities, including the relationships between functions, to provide comprehensive tracking of function executions and dependencies.

### Log

BabyAdam implements a comprehensive logging system to track all function executions and their interactions. The logging mechanism ensures that every function call, including its inputs, outputs, execution time, and any errors, is recorded for monitoring and debugging purposes.

**Key Logging Features:**

- **Execution Tracking:** Logs when a function starts and finishes execution, including the function name, arguments, keyword arguments, and execution time.

- **Error Logging:** Captures and logs any errors that occur during function execution, providing detailed error messages for troubleshooting.

- **Dependency Management:** Automatically resolves and logs dependencies between functions, ensuring that all required functions and libraries are loaded before execution.

- **Trigger Logging:** Logs the execution of triggered functions, detailing which functions were triggered by others and their respective execution outcomes.

- **Comprehensive Records:** Maintains a history of all function executions, enabling users to review past activities, understand function relationships, and analyze performance metrics.

**How Triggers Work:**

Triggers are mechanisms that allow certain functions to be automatically executed in response to specific events or actions within the system. For example, when a function is added or updated, a trigger can initiate the generation of a description for that function.

Triggers enhance the autonomy of BabyAdam by enabling automated workflows and reducing the need for manual intervention. However, it's essential to manage triggers carefully to avoid unintended recursive executions or conflicts between dependent functions.

## Dashboard

The BabyAdam dashboard offers a user-friendly interface for managing functions, monitoring executions, and handling configurations. Key features include:

- **Function Management:** Register, deregister, and update functions directly from the dashboard.

- **Dependency Visualization:** View and manage dependencies between functions to understand their relationships.

- **Secret Key Management:** Add and manage secret keys securely through the dashboard interface.

- **Logging and Monitoring:** Access comprehensive logs of function executions, including inputs, outputs, and execution times.

- **Trigger Management:** Set up triggers to automate function executions based on specific events or conditions.

**Accessing the Dashboard:**

After running your application, navigate to `http://localhost:8080/dashboard` to access the BabyAdam dashboard.

## Pre-loaded Functions Summary

BabyAdam includes two pre-loaded function packs:

1. **Default Functions (`packs/default_functions.py`):**
   - **Function Execution:** Run, add, update, or retrieve functions and versions.
   - **Key Management:** Add and retrieve secret keys.
   - **Triggers:** Add triggers to execute functions based on others.
   - **Logs:** Retrieve logs with optional filters.

2. **AI Functions (`packs/ai_generator.py`):**
   - **AI Description & Embeddings:** Auto-generate descriptions and embeddings for functions.
   - **Function Selection:** Find or choose similar functions based on prompts.

## Running a Self-Building Agent

BabyAdam includes two experimental self-building agents, showcasing how the framework can help a self-building coding agent leverage existing functions to write new ones.

### 1. `process_user_input` in the `code_writing_functions` pack

This function first determines whether to use an existing function or generate new ones. If new functions are needed, it breaks them down into smaller reusable components and combines them into a final function.

Try this:

```python
import babyadam

babyadam.add_key_wrapper('openai_api_key', os.environ['OPENAI_API_KEY'])
babyadam.load_functions("drafts/code_writing_functions")

babyadam.process_user_input("Grab today's score from ESPN and email it to test@test.com")
```

When you run this, you will see the functions being generated in the shell and new functions will be available in the dashboard once completed.

### 2. `self_build` in the `self_build` pack

This function takes a user description and generates X distinct tasks that a user might ask an AI assistant. Each task is processed by `process_user_input`, creating new functions if no existing ones suffice.

Try this:

```python
import babyadam

babyadam.add_key_wrapper('openai_api_key', os.environ['OPENAI_API_KEY'])
babyadam.load_functions("drafts/code_writing_functions")
babyadam.load_functions("drafts/self_build")

babyadam.self_build("A sales person at an enterprise SaaS company.", 3)
```

This will generate 3 distinct tasks a salesperson might ask an AI assistant and create functions to handle those.

*The functions will be generated and stored in the dashboard, but note that the generated code is minimal and may need improvement.

**Warning:** These draft features are experimental concepts and may not function as intended. They require significant improvements and should be used with caution.

## GitHub Repository

This project is hosted on GitHub at [https://github.com/ai-in-pm/babyadam](https://github.com/ai-in-pm/babyadam).

### Cloning the Repository

```bash
git clone https://github.com/ai-in-pm/babyadam.git
cd babyadam
```

### Installation from Source

```bash
# Install dependencies
pip install -e .
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

BabyAdam is released under the MIT License. See the [LICENSE](LICENSE) file for more details.
