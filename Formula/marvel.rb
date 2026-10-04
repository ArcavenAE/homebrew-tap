class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.230515.59a014b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-230515-59a014b/marvel-darwin-arm64"
    sha256 "634d277dcceb7e6c2cefd65eb061ade8e50cd3047ac1300f0c8c5b51f30413e1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-230515-59a014b/marvel-darwin-amd64"
    sha256 "a24d94d404b59bfca144a5bcad3016f14773006e9480f3d9b771f5245e04de50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-230515-59a014b/marvel-linux-arm64"
    sha256 "8c9bed1212591f16048f99a69dbcf9da77095e3e5fc1f5671a38d76ef4f8c9ff"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-230515-59a014b/marvel-linux-amd64"
    sha256 "955c533b4de33a2dfe47ecab25f692b6b8feb72e30427470d29b5ac8b5c51341"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
