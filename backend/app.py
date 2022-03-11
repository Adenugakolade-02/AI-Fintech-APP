from fastapi import FastAPI, Query
import uvicorn
import pickle
import numpy as np
from typing import List
from pydantic import BaseModel, conlist

app = FastAPI(debug=True)
standard_scale = pickle.load(open('scale.pickle', 'rb'))
model = pickle.load(open('Boost.pickle','rb'))

class ScaleData(BaseModel):
    data:List[conlist(int, min_items=11, max_items=11)]

class TrainData(BaseModel):
    data:List[conlist(float, min_items=28,max_items=28)]


@app.get('/')
def home():
    return {'text':'This is a trial'} 


@app.post('/scale')
def scale_data(s_data: List[conlist(int, min_items=11, max_items=11)]):
    print(s_data)
    result  = standard_scale.transform(np.array(s_data).reshape(1,-1))
    return {'result':result.tolist()[0]}


@app.post('/predict')
def predict(trainData: List[conlist(float, min_items=28,max_items=28)]):
    result = model.predict(np.array(trainData).reshape(1,-1))
    
    if (result.tolist()[0]==0):
        
        return {'prediction result': 'Bad'}
    
    else:
        return{'prediction result': 'Good'}
    



if __name__ == '__main__':
    uvicorn.run(app)