class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261019.225652.d5233d5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-225652-d5233d5/marvel-darwin-arm64"
    sha256 "34ae0a4873d2845617e75e2b488e5e5a609f77651c0584694bcd9aff6a7c6ab7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-225652-d5233d5/marvel-darwin-amd64"
    sha256 "151a0df70404606e03cac8d2c353ee8793869d039ce34787a635b60d45d5126c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-225652-d5233d5/marvel-linux-arm64"
    sha256 "046ea92daf62d8560e2281dec833f25127d5dd14a7f2974995f55483ebcb4511"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-225652-d5233d5/marvel-linux-amd64"
    sha256 "46fc5fc55f03ccebacf05975561b657def23a08bba52d61fad229a83556e21d4"
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
