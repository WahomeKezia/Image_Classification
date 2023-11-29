# Use an official Python runtime as a parent image
FROM python:3.9.7-slim

# Set the working directory in the container
WORKDIR /app

# Install Rust
RUN apt-get update && apt-get install -y curl && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Copy only the necessary files into the container
COPY app/app_st.py /app
COPY requirements.txt /app

# Install any dependencies needed
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Make port 8501 available to the world outside this container
EXPOSE 8501

# Command to run your application
CMD ["streamlit", "run", "app_st.py"]
