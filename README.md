# Weatherapp
A comprehensive command-line weather application that retrieves current weather conditions and forecasts using dual data sources: Google Search scraping (primary) with OpenWeatherMap API fallback.


## Author
IllusiveHacks  
GitHub: @illusivehacks

## Features

- **Dual Data Source Architecture**: Attempts Google Search scraping first, automatically falls back to OpenWeatherMap API if needed
- **Current Weather Data**: Temperature, feels-like temperature, humidity, wind speed/direction, pressure, visibility, sunrise/sunset times
- **Weather Forecasts**: 24-hour hourly forecast and 5-day daily forecast
- **City Management**: Add/remove favorite cities, view search history
- **Data Export**: Export weather data to JSON format
- **Temperature Graphing**: Generate visual temperature trend graphs (requires API data)
- **City Comparison**: Compare weather conditions across multiple cities simultaneously
- **Interactive Mode**: User-friendly menu-driven interface
- **Database Caching**: SQLite-based caching to reduce API calls and improve performance
- **Source Transparency**: Clearly indicates whether data came from Google Search or OpenWeatherMap API

## Prerequisites

- Python 3.8 or higher
- Internet connection for weather data retrieval

## Installation

1. Clone or download the repository:
```bash
git clone https://github.com/illusive7ai/Weatherapp.git
cd Weatherapp
```

2. Install required dependencies:
```bash
pip install requests beautifulsoup4 rich matplotlib python-dotenv
```

3. (Optional) Create a `.env` file to override the default API key:
```
OPENWEATHER_API_KEY=your_api_key_here
```

Note: The application includes a default OpenWeatherMap API key that works for basic usage. For production or heavy use, obtain your free API key from [OpenWeatherMap](https://openweathermap.org/api).

## Usage

### Basic Usage

Get weather for a city (uses Google first, falls back to API):
```bash
python weather.py London
python weather.py "New York"
python weather.py Tokyo
```

### Command Line Options

| Option | Short | Description |
|--------|-------|-------------|
| `city` | - | City name to check weather (positional argument) |
| `--graph` | `-g` | Generate temperature trend graph |
| `--compare` | `-c` | Compare multiple cities (space-separated) |
| `--favorites` | `-f` | List all favorite cities |
| `--add-favorite` | `-a` | Add a city to favorites |
| `--remove-favorite` | `-r` | Remove a city from favorites |
| `--history` | - | Show search history |
| `--interactive` | `-i` | Launch interactive mode |
| `--export` | `-e` | Export weather data to JSON file |
| `--force-google` | - | Force Google scraping only (no API fallback) |
| `--force-api` | - | Force OpenWeatherMap API only (no Google scraping) |
| `--help` | `-h` | Show help message |

### Examples

**Get weather with graph:**
```bash
python weather.py "New York" --graph
```

**Compare multiple cities:**
```bash
python weather.py --compare London Paris Tokyo
```

**Manage favorites:**
```bash
python weather.py --add-favorite London
python weather.py --add-favorite Paris
python weather.py --favorites
python weather.py --remove-favorite Paris
```

**View search history:**
```bash
python weather.py --history
```

**Export data to JSON:**
```bash
python weather.py London --export weather_data.json
```

**Force specific data source:**
```bash
python weather.py Nairobi --force-api
python weather.py Tokyo --force-google
```

**Interactive mode:**
```bash
python weather.py --interactive
```

## Interactive Mode Menu

When running in interactive mode, the following options are available:

1. Search weather (Google -> API fallback)
2. View favorites
3. View history
4. Plot temperature trend (API only)
5. Compare cities
6. Add to favorites
7. Remove from favorites
8. Exit

## Output Information

The application displays the following weather information when available:

- **Current Conditions**: Temperature, feels-like temperature, weather description
- **Humidity**: Percentage of humidity
- **Wind**: Speed and direction
- **Pressure**: Atmospheric pressure in hPa
- **Visibility**: In kilometers
- **Sunrise/Sunset**: Local times
- **24-Hour Forecast**: Hourly temperature and conditions
- **5-Day Forecast**: Daily high/low temperatures and conditions
- **Data Source**: Indicates whether data came from Google Search or OpenWeatherMap API

## Database Structure

The application uses SQLite to maintain three tables:

- **search_history**: Logs all weather searches with timestamps
- **favorites**: Stores user's favorite cities
- **weather_cache**: Caches weather data for 10 minutes to reduce redundant requests

## Data Sources

### Primary: Google Search Scraping
- Scrapes weather information from Google's search results
- Provides quick access without API keys
- May be subject to rate limiting or temporary blocks

### Fallback: OpenWeatherMap API
- Free tier available at OpenWeatherMap
- Provides comprehensive current weather and forecast data
- Requires API key (default demo key included)
- Supports temperature graphing and extended forecasts

## Troubleshooting

**Google scraping fails:**
- This is normal behavior. Google may temporarily block automated requests.
- The application automatically falls back to the OpenWeatherMap API.
- Wait a few minutes and try again, or use `--force-api` flag.

**API rate limiting:**
- The free OpenWeatherMap API has call limits.
- Cache reduces repeated requests for the same city.
- Obtain a free API key and add it to the `.env` file for higher limits.

**Database errors:**
- Delete the `weather.db` file to reset the database.
- The application will recreate it with proper schema on next run.

**City not found:**
- Use full city names (e.g., "New York" instead of "NY").
- Check spelling and try again.
- Some smaller cities may only be available via the API.

## License

This project is open-source and available for personal and commercial use.

## Contributing

Contributions are welcome! Feel free to submit issues and pull requests on GitHub.

## Acknowledgments

- OpenWeatherMap for providing the weather API
- Google for search weather data
- Rich library for beautiful terminal formatting
- Beautiful Soup for HTML parsing

## Version History

- 1.0.0 - Initial release with dual data sources, caching, favorites and interactive mode
