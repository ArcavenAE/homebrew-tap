class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260926.061334.e360c58"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-061334-e360c58/marvel-darwin-arm64"
    sha256 "c56e978041bf62300c0eff480f6fae0ddbdf97beaed2dae4291961fe0c9bd5ee"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-061334-e360c58/marvel-darwin-amd64"
    sha256 "6938720678d01376e6de96dd5e55f2403e965f0d90f1e8043b5589b49a10a463"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-061334-e360c58/marvel-linux-arm64"
    sha256 "a936ddcc59df22584363068d2736c0d7485b7922794a849e5d8dda41a7470125"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-061334-e360c58/marvel-linux-amd64"
    sha256 "ca63946089a43da55c4100d4a8a34ee4863f631125307cf65460174341a5430c"
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
