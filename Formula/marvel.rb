class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.110236.8e488f2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-110236-8e488f2/marvel-darwin-arm64"
    sha256 "59f0f138f45f40908d2df84280dec4178450b419851691699ccd94b5298893ff"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-110236-8e488f2/marvel-darwin-amd64"
    sha256 "f84b2d00fd0c94fe0bf3dfab6d93fbc3a04456b78db7b92bdb3a58ea80100016"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-110236-8e488f2/marvel-linux-arm64"
    sha256 "1f18eec7cf44b45d2d49eac5bd8cc857ae766a1a81ba2c63a103b8255ea07f6b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-110236-8e488f2/marvel-linux-amd64"
    sha256 "52e32fbc97a309d41c5ffec912d3b33d6a67295b158755dd20c9aed5a18328cb"
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
