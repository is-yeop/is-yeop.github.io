---
title: "Discord Bot 생성"
categories:
    - python
tags:
    - python
    - discord
last_modified: 2021-02-05T11:37:54
comment: true
---

# discord bot 제작하기

## member list
``` python
import os
import discord
from dotenv import load_dotenv

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')

intents = discord.Intents.all()
client = discord.Client(intents=intents)

@client.event
async def on_ready():
    print(f'{client.user} has connected')
    for guild in client.guilds:
        print(guild.name)
        print(guild.members)
        for user in guild.members:
            print(user.name)

client.run(TOKEN)
```

`guild.members`를 이용해 list를 불러오고 `intents`를 통해 client를 초기화해줘야한다. 

(*안그럼 list에 bot 하나만 뜬다!)

- [관련링크](https://stackoverflow.com/questions/64840612/how-to-get-members-of-a-discord-guilddiscord-py)


---
### 참고 사이트
- https://realpython.com/how-to-make-a-discord-bot-python/
- [python 환경 key 관리](https://mingrammer.com/ways-to-manage-the-configuration-in-python/)
- [user profile 가져오기](https://discordpy.readthedocs.io/en/latest/api.html?highlight=user#discord.Profile.user)
# 밥