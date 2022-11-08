%Loading the image data
imds = imageDatastore('C:\Users\HP\Desktop\Thesis\Resized_dataset', ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

%%
%Cross-Validation using Hold-out method

[imdsTrain, imdsValidation] = splitEachLabel(imds,0.7,'randomized');
%%
%%%%%%%code for resizing
inputSize=[227 227 3];
%%
augimdsTrain = augmentedImageDatastore(inputSize,imdsTrain);
augimdsValidation = augmentedImageDatastore(inputSize,imdsValidation);

%%
net = alexnet;
%%
analyzeNetwork(net);
%%
ndims = arrayfun(@(x) ndims(imread(imds.Files{x})),1:numel(imds.Files),'un',0);
unsz=unique(vertcat(ndims{:}), 'rows');

%%
layer='fc8';
%%
featuresTrain = activations(net,augimdsTrain,layer,'OutputAs', 'rows');
featuresTest = activations(net,augimdsValidation,layer,'OutputAs','rows');

