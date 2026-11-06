class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.075336.a9b3c00"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-075336-a9b3c00/marvel-darwin-arm64"
    sha256 "7a36d81102e84bb86a7d90f1846f42236833680ed88811794fbc2cee135399e2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-075336-a9b3c00/marvel-darwin-amd64"
    sha256 "49fa6b8e728c3063540eac7f674dcca9295e25722f4aa11410609c3406fb5ff9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-075336-a9b3c00/marvel-linux-arm64"
    sha256 "c45863dccd3653fc5942b7b0cb722602c3c92513935cd7c9ee1c39b024698661"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-075336-a9b3c00/marvel-linux-amd64"
    sha256 "01f4d9e0441263c3883394c101410e88e6f59e6ea5dfab210a6e5d779294dde9"
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
