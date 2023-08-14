#!/bin/sh
python3 run_ensemble_no_trainer.py --output_dir ./output_stacking --with_stacking --with_tracking
# note you can track with wandb by adding --with_tracking
# eval_only because we're not retraining the resnets
