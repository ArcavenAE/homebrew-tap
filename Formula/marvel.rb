class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.042351.6fb04a3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-042351-6fb04a3/marvel-darwin-arm64"
    sha256 "82db9695032974f51f286791911c9e21e4d59505dbfca654252ed05a6a7ae0a3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-042351-6fb04a3/marvel-darwin-amd64"
    sha256 "ad961aa38a2da19df5dbec713bc3278fd2eb54b6d45e752e4fec6037c05ff065"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-042351-6fb04a3/marvel-linux-arm64"
    sha256 "427bef9cc541aa29bf42a826d0cbcdbccc1676c61d76e7a5484d54d52f42ff03"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-042351-6fb04a3/marvel-linux-amd64"
    sha256 "fda6f2647a2bee9cad9564a4b24fbbb198c6916478478aa6450bf1544aa3c504"
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
