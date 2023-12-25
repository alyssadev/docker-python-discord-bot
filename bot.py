from interactions import Client, listen
from os import environ

bot = Client(token=environ["BOT_TOKEN"])

@listen()
async def on_startup():
    print("Bot started")

bot.start()
