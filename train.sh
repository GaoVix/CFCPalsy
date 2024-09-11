
CUDA_VISIBLE_DEVICES=0,1 python src/train.py \
        prefix=CCFExp \
        datamodule.total_gpu_batch_size=32 \
        datamodule=palsy_f \
        lightning.max_epochs=10 \
        recognition=casia_ir50 \
        optimizer.optimizer_model.lr=0.0001 \
        datamodule.img_size=112 \
        model=default \
        trainer.sampler.variance_type='learned_range' \
        model.unet_config.params.gradient_checkpointing=false \
        model.unet_config.params.condition_type=crossatt_and_stylemod \
        model.unet_config.params.condition_source=patchstat_spatial_and_image \
        label_mapping=v4 \
        losses.landmarks_loss_lambda=1 \
        losses.sec_loss_sigma=0.3 \
        losses.identity_consistency_loss_lambda=0.05 \
        losses.identity_consistency_loss_source=mix \
        losses.identity_consistency_loss_version=simple_mean \
        losses.identity_consistency_mix_loss_version=polynomial_1 \
        losses.identity_consistency_loss_center_source=id_image \
        losses.identity_consistency_loss_time_cut=0.0 \
        losses.identity_consistency_loss_weight_start_bias=0.0 \
        losses.spatial_consistency_loss_lambda=0.0 \
        losses.latent_mixup_loss_lambda=0.0 \
        losses.face_contour_loss_lambda=0.0 \
        datamodule.trim_outlier=true \
        model.unet_config.freeze_unet=false \
        callbacks.model_checkpoint.save_top_k=-1 \
