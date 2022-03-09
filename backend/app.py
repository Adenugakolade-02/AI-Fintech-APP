from fastapi import FastAPI, Query
import uvicorn
import pickle
import numpy as np
from typing import List
from pydantic import BaseModel, conlist

app = FastAPI(debug=True)

class ScaleData(BaseModel):
    data : List[conlist(int, min_items=11, max_items=11)]

standard_scale = pickle.load(open('backend/scale.pickle', 'rb'))

@app.get('/')
def home():
    return {'text':'This is a trial'} 

@app.post('/scale')
def scale_data(s_data: ScaleData):
    data = dict(s_data)['data']
    
    result  = standard_scale.transform(np.array(data).reshape(1,-1))
    
    return {'result':result.tolist()}
@app.post('/predict')

if __name__ == '__main__':
    uvicorn.run(app)