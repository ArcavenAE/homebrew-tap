class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.021608.b54d83b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-021608-b54d83b/marvel-darwin-arm64"
    sha256 "01c13323b221c512a63d974b87594915139d3a47bf352cddfbfd791f7373afce"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-021608-b54d83b/marvel-darwin-amd64"
    sha256 "c49a36a8301e0b39a678fbf9a018e0dbc70ef17716932fd0e5c052627f8c30c1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-021608-b54d83b/marvel-linux-arm64"
    sha256 "b4b79c68871e0ac4b22a33ca814af3470065e7f4861a040b4635301143c328ed"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-021608-b54d83b/marvel-linux-amd64"
    sha256 "78e43f5eaef343936d11144843e34a439620ddaa94483d08bdfe1a022e63deb7"
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
