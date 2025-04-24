from setuptools import setup, find_packages
import os

# Read the long description from README.md
with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

# Read requirements from requirements.txt
def parse_requirements(filename):
    with open(filename, "r") as f:
        lines = f.readlines()
    # Remove comments and empty lines
    return [line.strip() for line in lines if line.strip() and not line.startswith("#")]

setup(
    name="babyadam",  # Ensure this is the desired package name
    version="0.1.2",  # Update this version appropriately
    author="Darrell Mesa",
    author_email="darrell.mesa@pm-ss.org",
    description="An experimental prototype framework for building self building autonomous agents.",
    long_description=  long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/ai-in-pm/babyadam",  # Update if necessary
    packages=find_packages(),
    include_package_data=True,  # Include package data as specified in MANIFEST.in
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
    install_requires=parse_requirements("requirements.txt"),
    entry_points={
        'console_scripts': [
            'babyadam=babyadam.main:main',  # Example entry point
        ],
    },
    keywords="AGI, AI, Framework, Baby Adam",
    project_urls={  # Optional
        "Author": "https://github.com/ai-in-pm",
        "Source": "https://github.com/ai-in-pm/babyadam",
    },
)
