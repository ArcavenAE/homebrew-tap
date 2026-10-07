class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.193828.f7c4250"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-193828-f7c4250/marvel-darwin-arm64"
    sha256 "773a0541f20a84442491386a2297ac86ac04147d0cec827bec77d59cac734afe"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-193828-f7c4250/marvel-darwin-amd64"
    sha256 "4edb17fb21cc124546cf0baa05b494c135a103f21c33ddd5a726838f53688bcd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-193828-f7c4250/marvel-linux-arm64"
    sha256 "e9a0943bf172ae97c6873e6af3cb849afb87d022d37dd253737b5ae9fd880b2a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-193828-f7c4250/marvel-linux-amd64"
    sha256 "563b10573a0f2fb4494e0f75c22953e800add2218af4b1d7386f8d0784d32011"
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
