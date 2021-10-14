# TODO: Get platform
# Example
# [[ "$(which_platform)" == "mac" ]] && echo "platform is a mac."
which_platform () {
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		echo "linux"
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		echo "mac"
	elif [[ "$OSTYPE" == "cygwin" ]]; then
		# POSIX compatibility layer and Linux environment emulation for Windows
		echo "cygwin"
	elif [[ "$OSTYPE" == "msys" ]]; then
		# Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
		echo "msys"
	elif [[ "$OSTYPE" == "win"* ]]; then
		echo "windows"
	elif [[ "$OSTYPE" == "win32" ]]; then
		echo "win32"
	else
		echo "unknown"
	fi
}
