from flask import Flask, request

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
import numpy as np
import pandas as pd
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/')
def home():
        return 'hello'



@app.route('/tospring',methods=['GET'])
def run_model():  # put application's code here
        a = int(request.args.get('myteam_Kills'))
        b = int(request.args.get('myteam_Deaths'))
        c = int(request.args.get('myteam_Assists'))
        d = int(request.args.get('myteam_Golds'))
        e = int(request.args.get('vsteam_Kills'))
        f = int(request.args.get('vsteam_Deaths'))
        g = int(request.args.get('vsteam_Assists'))
        h = int(request.args.get('vsteam_Golds'))
        i = int(request.args.get('my_golds'))
        user = np.array([[a, b, c, d, e,f, g, h]])
        df = pd.read_csv("data/sample.csv")
        tmp = df.groupby(['GAMEID', 'TEAMID', 'WIN'])['KILLS', 'DEATHS', 'ASSISTS', 'GOLDEARNED'].sum()
        tmp = tmp.reset_index()
        blueteam = tmp[tmp.TEAMID == 100]
        redteam = tmp[tmp.TEAMID == 200].rename(
            columns={'KILLS': 'RED_KILLS', 'DEATHS': 'RED_DEATHS', 'ASSISTS': 'RED_ASSISTS', 'GOLDEARNED': 'RED_GOLD'})
        redteam = redteam.drop(['TEAMID', 'WIN'], axis=1)
        tmp2 = pd.merge(blueteam, redteam, on='GAMEID')
        tmp2 = tmp2.drop(['GAMEID', 'TEAMID'], axis=1)
        x_data = tmp2.drop('WIN', axis=1)
        y_data = tmp2['WIN']
        train_input, test_input, train_target, test_target = train_test_split(x_data, y_data, test_size=0.3,
                                                                              random_state=40)
        lr = LogisticRegression(C=10, max_iter=5000)
        lr.fit(train_input, train_target)
        pred2 = lr.predict_proba(user)

        bb = round(pred2[0][1],4)

        cc = round((bb * ((i / d) * 100)) * 0.1, 2)

        result = f'당신의 팀은 {bb*100}%의 승산이 있었습니다. 당신은 {cc}인분을 했습니다'

        return result

if __name__ == '__main__':
    app.run(debug=False, host="127.0.0.1", port=5000)