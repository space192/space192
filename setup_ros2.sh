sudo apt-get install git -y
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
git clone https://gitlab.com/arece/arece-msgs.git
git clone https://gitlab.com/arece/arece-sim.git
sudo apt-get install python3-pip -y
pip3 install colcon-common-extensions -U
export ARECE_MASTER=~/ros2_ws/src/arece-sim
echo 'export ARECE_MASTER=~/ros2_ws/src/arece-sim/' >> ~/.bashrc
sudo apt-get install python3-rosdep -y
sudo rosdep init
rosdep update
rosdep install --from-paths $ARECE_MASTER --ignore-src -r -y
cd ~/ros2_ws
sudo apt install python3-colcon-common-extensions -y
colcon build
echo 'source ~/ros2_ws/install/setup.bash' >> ~/.bashrc
source ~/ros2_ws/install/setup.bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
cd ~/ros2_ws/src
git clone https://gitlab.com/arece/arece-stereo.git
pip3 install cython
cd ~/Documents
mkdir TensorFlow
cd ~/Documents/TensorFlow
git clone https://github.com/tensorflow/models.git
cd ~/Downloads
cd ~/Documents/TensorFlow/models/research
protoc object_detection/protos/*.proto --python_out=.
cd ~/Downloads
git clone https://github.com/cocodataset/cocoapi.git
cd ~/Downloads/cocoapi/PythonAPI
sed -i 's/python/python3/g' Makefile
make
cp -r pycocotools ~/Documents/TensorFlow/models/research/
rm -rf ~/Downloads/cocoapi
cd ~/Documents/TensorFlow/models/research/
cp object_detection/packages/tf2/setup.py .
python3 -m pip install .
pip3 install --upgrade numpy==1.22.4
pip3 install --upgrade protobuf==3.19.5
pip3 uninstall google-api-core
pip3 install pandas
pip3 install --upgrade pytest
cd ~/ros2_ws
colcon build
cd ~/ros2_ws/src
git clone https://gitlab.com/arece/arece-rs.git
sudo apt-get install clang -y
cd ~/ros2_ws
colcon build
