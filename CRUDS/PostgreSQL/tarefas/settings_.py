from pathlib import Path
import os
from dotenv import load_dotenv

BASE_DIR = Path(__file__).resolve().parent.parent
ENV_PATH = os.path.join(BASE_DIR, '.env')

load_dotenv(dotenv_path=ENV_PATH)

DB_HOST = os.getenv("host")
DB_PORT = os.getenv("port")
DB_USER = os.getenv("user")
DB_PASSWORD = os.getenv("password")
DB_DATABASE = os.getenv("database")
