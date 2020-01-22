# output-ogs-dataset


The [OGS](https://online-go.com) plataform offers an API where download public information of games and players.

This database contains one file per player. In each file are all games played before october 2013. The information was gathered through: 

```python
"https://online-go.com/api/v1/players/{}/games?page_size=100&format=json".format(user_id)
```
We store this information as python's dictionary at pickle files. They have a lot of information. The main information can be summarized with with this function:
i:
```python
def reduce_games(game): 
    res = {}
    res['id'] = game['id']
    res['annulled'] = game['annulled']
    res['black'] = int(game['black'])
    res['white'] = int(game['white'])
    res['order'] = [int(game['white_lost']),int(game['black_lost'])]
    res['outcome'] = game['outcome']
    res['handicap'] = game['handicap']
    res['komi'] = game['komi']
    res['ranked'] = game['ranked']
    res['width'] = game['width']
    res['started'] = game['started']
    res['ended'] = game['ended']
    res['tournament'] = not game['tournament'] is None
    return res
```



