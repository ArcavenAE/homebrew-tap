class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.071937.ffde0aa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-071937-ffde0aa/marvel-darwin-arm64"
    sha256 "eccef2fd7a11c5152d47ee9ca588f6361c6985d8e34ffdc785c2f214cf2ff1f8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-071937-ffde0aa/marvel-darwin-amd64"
    sha256 "a82c1e8ba6e22c806b5a9e26c813d2b17054099e76b15e3313121773d8553fbe"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-071937-ffde0aa/marvel-linux-arm64"
    sha256 "92ba1d0c8b9aa4955d1c9313a8c0eea8f7bee33f4a416212f76ed8b727394d3b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-071937-ffde0aa/marvel-linux-amd64"
    sha256 "496490f80c7ce450da59874aeaac0f7b140f7942591396dfb25c90f52967f8b0"
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
