{ buildPythonPackage
, tensorflow-bin_2
, tensorflow-probability
#, tf-agents
, gym
, matplotlib
, mujoco-py
, click
, transforms3d
}:
buildPythonPackage {
  pname = "dads";
  version = "0.1.1";

  propagatedBuildInputs = [
    tensorflow-bin_2
    tensorflow-probability
    #tf-agents
    gym
    matplotlib
    mujoco-py
    click
    transforms3d
  ];
}
