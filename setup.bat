: submodule init
git submodule update --init

: patch stylegan2-pytorch
cd stylegan2-pytorch
: use torch native code instead of cpp_extension
git am ..\patches\0001-cpp-ext-Remove-and-alter-to-torch-native.patch 
: fix generate.py 
git am ..\patches\0002-generate-Disable-strict-of-load_state_dict.patch
cd ..

: setting environments
conda create -n tf114 python=3.6
conda activate tf114
pip install tensorflow-gpu==1.14 tqdm
conda install -c anaconda numpy pillow requests
conda install -c pytorch pytorch torchvision cudatoolkit=10.1

: weight conversion
python .\stylegan2-pytorch\convert_weight.py --repo .\stylegan2 .\release\stylegan2-church-config-f.pkl
move .\stylegan2-church-config-f.pt .\release

: test stylegan2-pytorch
mkdir sample
python .\stylegan2-pytorch\generate.py --ckpt .\release\stylegan2-church-config-f.pt --pics 1 --size 256 
