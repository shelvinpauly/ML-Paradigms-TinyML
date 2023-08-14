
# Ensemble Learning and Federated Learning

This project explores ensemble learning techniques for image classification and compares them with federated learning approaches. Experiments were conducted on the Tiny ImageNet dataset.

## Ensemble Learning

- Trained 5 ResNet-18 models on different splits of 200 Tiny ImageNet classes 
- Compared selection schemes like random, oracle, confidence, entropy for combining predictions
- Added class overlap between splits improved accuracy over non-overlapping splits
- Stacking ensemble features performed worse than selection schemes  

## Federated Learning 

- Implemented FedAvg and FedProx algorithms with ResNet clients on Tiny ImageNet
- Analyzed impact of client ratio, heterogeneity, local vs global epochs, and regularization
- Federated learning achieved better generalization than ensemble after fine-tuning
- Local model personalization decreased global performance due to overfitting 

## Key Insights

- Careful task creation improves ensemble accuracy over random splits
- Federated learning shows tradeoff between local and global performance
- Ensemble models tend to be more specialized, federated models more generalizable

## Reference

[Project Report](CMSC828A_Assignment_2__timber_.pdf)
