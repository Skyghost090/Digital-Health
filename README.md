# Digital Health

![Contributors](https://img.shields.io/github/contributors/skyghost090/Digital-Health?style=plastic)
![Forks](https://img.shields.io/github/forks/skyghost090/Digital-Health)
![Stars](https://img.shields.io/github/stars/skyghost090/Digital-Health)
![Licence](https://img.shields.io/github/license/skyghost090/Digital-Health)
![Issues](https://img.shields.io/github/issues/skyghost090/Digital-Health)

Digital Health is a digital wellness application designed to help users manage their screen time on Linux. It allows users to set limits on application usage, promoting healthier digital habits and improving productivity.

## Features

- Set daily or session-based usage limits for specific applications.
- Receive notifications when approaching time limits.
- Automatically block applications after the time limit is reached.
- User-friendly interface for managing app restrictions.
- Customizable settings to fit individual needs.
- Lightweight and optimized for Linux environments.

## Installation

### Dependencies
Ensure your system has the following dependencies installed:
- Python 3.x
- PyQt5
- CMake

### Install via Git
```sh
# Clone the repository
git clone https://github.com/Skyghost090/Digital-Health.git
cd Digital-Health
./installservice.sh
# Install required dependencies
pip install pyqt5

# Run the application after build
(./service.sh)& python3 main.py
```

## Usage

1. Launch **Digital Health**.
2. Select the applications you want to restrict.
3. Set the time limits for each app.
4. Monitor your usage and receive alerts when approaching your limits.
5. Once the time limit is reached, the application will be blocked.

## Building
```sh
cmake .; make
```

## Contributing

We welcome contributions! Feel free to submit pull requests or report issues on our [GitHub repository](https://github.com/Skyghost090/Digital-Health.git).

## License

This project is licensed under the BSD License. See the `LICENSE` file for more details.

