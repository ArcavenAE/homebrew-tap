class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.053116.7393e78"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-053116-7393e78/marvel-darwin-arm64"
    sha256 "bacc03aeb74d7c57432c7b4d363757f6a0ca34b749c5101d02ab1ed4c9c47f19"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-053116-7393e78/marvel-darwin-amd64"
    sha256 "7cdc42e4ca37b40f70164bc2d79dcc9f59e45a5ec8739c164d9bf85d5b525190"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-053116-7393e78/marvel-linux-arm64"
    sha256 "8b71f7142663d6dc3e91faba1172dbf4e8b93ce08259a028c8a673fe05f84266"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-053116-7393e78/marvel-linux-amd64"
    sha256 "3fe89e314521015f7e3f1ca3778fcb06ccb354ffd8d8d18c0f0cc3a5fc0217b1"
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
