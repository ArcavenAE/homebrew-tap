class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261005.161321.b414fc6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-161321-b414fc6/marvel-darwin-arm64"
    sha256 "6238d5cdcb0f3719181943a90ba2cd1ffcd80162e5121c447147b4134e33677c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-161321-b414fc6/marvel-darwin-amd64"
    sha256 "dea4fd430acf699888b14376f99d927ef7b8461a2fc9718988bce7ac753ce6e3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-161321-b414fc6/marvel-linux-arm64"
    sha256 "2d8490d25b9c1d6b8c22ee64bf5109f7e25dc78b748a71728269202f668a987f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-161321-b414fc6/marvel-linux-amd64"
    sha256 "e4814b1bcb6e6d73645d0fd6161d028b2ddb2516b1257a5c06365165ded34e5e"
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
