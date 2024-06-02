# RaCTS CLI

RaCTS CLI is a command-line tool built in Racket for managing concurrent and parallel execution of tasks. It provides a user-friendly interface for submitting tasks, monitoring their execution, and configuring scheduler settings from the terminal, making it easy for developers and administrators to leverage the power of concurrent programming in Racket applications.

## Features

- **Task Submission**: Submit tasks with specified functions, arguments, and priority levels.
- **Task Monitoring**: Monitor the status of submitted tasks, including their execution progress and completion status.
- **Scheduler Configuration**: Configure scheduler settings such as thread pool size and scheduling policies.
- **Task Dependency Management**: Manage dependencies between tasks to ensure correct execution order.

## Installation

To install RaCTS CLI, use the following command:

```sh
raco pkg install racts-cli
```

## Usage

### Submitting a Task

Submit a task to the scheduler by specifying the function name, arguments, and priority level.

```sh
racts submit <function_name> --args <arguments> --priority <priority_level>
```

### Example:

```sh
racts submit fibonacci --args 10 --priority 1
```

## Monitoring a Task

### Monitor the execution of a specific task by providing its task ID.

```sh
racts monitor <task_id>
```

### Example:

```sh
racts monitor 123456
```

## Configuring the Scheduler

### Configure the scheduler settings such as the number of threads in the thread pool.

```sh
racts configure --threads <thread_count>
```

### Example:

```sh
racts configure --threads 8
```

## Task Dependency Management

### Specify dependencies between tasks to ensure correct execution order.

```sh
racts depend <task_id> --depends-on <dependency_task_id>
```

### Example:

```sh
racts depend 123456 --depends-on 654321
```

## Development

### Project Structure

The project directory should look like this:

```
racts-cli/
├── README.md
├── info.rkt
├── main.rkt
├── tasks.rkt
├── cli.rkt
└── tests.rkt
```

## Running Tests

### To run tests, use the following command:

```sh
racket tests.rkt
```

## Contributing

1. Fork the repository on GitHub.
2. Clone your forked repository.
3. Create a new branch for your feature or bug fix.
4. Make your changes and commit them with descriptive messages.
5. Push your changes to your forked repository.
6. Create a pull request to the main repository.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Acknowledgments

Thanks to the Racket community for their support and contributions to the Racket ecosystem.

## Contact

For any questions or issues, please open an issue on the GitHub repository or contact the project maintainers(aka me).
