#!/bin/bash

echo "🌤️  Setting up Advanced WeatherApp by IllusiveHacks"

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install requirements
pip install -r requirements.txt

# Create .env file
echo "OPENWEATHER_API_KEY= api here" > .env

echo "✅ Setup complete!"
echo "Get your API key from: https://openweathermap.org/api"
echo "Run: python weatherapp.py --interactive"