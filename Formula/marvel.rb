class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.110506.158106b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-110506-158106b/marvel-darwin-arm64"
    sha256 "92f58a13eef78e3801d0af184917284c4695f98aa1875933582c7c18572a0c46"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-110506-158106b/marvel-darwin-amd64"
    sha256 "e67a5437e670abfd8495c1edf03438f3472ffd327850b1213012116ca5a8d2ed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-110506-158106b/marvel-linux-arm64"
    sha256 "41775eec37276ffc8015887b3895cf586fe4e59caad3d1c3da9ec32416c9bd17"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-110506-158106b/marvel-linux-amd64"
    sha256 "cc8287c0e22b50a2f4d596b5f5248bb24254eec140bc2b69fdc1faabc3ac07cd"
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
