from pathlib import Path

from sorawm.core import SoraWM
from sorawm.schemas import CleanerType

if __name__ == "__main__":
    input_video_path = Path("resources/dog_vs_sam.mp4")
    output_video_path = Path("outputs/sora_watermark_removed.mp4")
    sora_wm = SoraWM(cleaner_type=CleanerType.E2FGVI_HQ)
    sora_wm.run(input_video_path, output_video_path)
