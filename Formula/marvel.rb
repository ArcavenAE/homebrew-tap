class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.151103.9b46939"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-151103-9b46939/marvel-darwin-arm64"
    sha256 "3ba704e4e12e1ee300c37a01ed9b07545b0cab39bcdcb5921c5f0d57b100ff43"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-151103-9b46939/marvel-darwin-amd64"
    sha256 "9a67b7256258ef76cedcb86c3eae49d68541701c746bcb88ed12c117ccb76f50"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-151103-9b46939/marvel-linux-arm64"
    sha256 "4a40d2120104bc0423c8d6799b1278efea37db8cf54c3394f7741d422d61b028"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-151103-9b46939/marvel-linux-amd64"
    sha256 "78dbe4c16ea4d67ab71b5acbf22eb682d689e0f7cbb05b86f43f6fffd1dca526"
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
