class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260928.042620.d6b89bf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042620-d6b89bf/marvel-darwin-arm64"
    sha256 "f800eb6d75ee6d375158ec07eef35828d66b921839e76678a3e001abc9e6892a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042620-d6b89bf/marvel-darwin-amd64"
    sha256 "0f6cf75755ba42c84bfa6c24df2a863dfed4625129e23b09e7f511d4b1e02e1e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042620-d6b89bf/marvel-linux-arm64"
    sha256 "2488a8870e0b17a1c7aafacba51423757ec4346c2d191a78cbe9668a37f37441"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042620-d6b89bf/marvel-linux-amd64"
    sha256 "461d345680464fbcde1b2226edc43377b33a121a802b42e2671b21f6a0870c45"
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
