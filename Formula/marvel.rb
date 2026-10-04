class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.070356.a6b1660"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-070356-a6b1660/marvel-darwin-arm64"
    sha256 "baad4d0e41fcc9f1105566c51f2befb7ca1807b27bf45fc04a7417d06f46c00b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-070356-a6b1660/marvel-darwin-amd64"
    sha256 "65b0f839201b04576cb68dd96b79da3b12c283252e942beaf63b6bf91998e259"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-070356-a6b1660/marvel-linux-arm64"
    sha256 "2cd6d1e09acddf33f69a600903f5c1ed1c6e42f84047ed1ae42e30b91c5a989f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-070356-a6b1660/marvel-linux-amd64"
    sha256 "e56cd09aaf7541ef172432aad90ad629edf2f8322fda2d5ea6e4e46366e43182"
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
