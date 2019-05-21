function [u, newStateData] = mpcEvaluate(y, r, configData, stateData, onlineData)

    u = 0;
    newStateData = stateData;

    onlineData.signals.ym = y;
    onlineData.signals.ref = r;
    
    [u, newStateData] = mpcmoveCodeGeneration(configData, stateData, onlineData);