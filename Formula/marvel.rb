class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.170410.b41be5b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-170410-b41be5b/marvel-darwin-arm64"
    sha256 "32b0cb5b509cd9bcaa50e2986a5b52cc62de48273395b557c966fc30ca835f08"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-170410-b41be5b/marvel-darwin-amd64"
    sha256 "0ce5acf2dbbd97c27074859018f31a56b561b5e87072e9631097edf21f83252e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-170410-b41be5b/marvel-linux-arm64"
    sha256 "de944a924e6823301dc86e18946466cae6bac243e00c4571a7b43a14b41d8564"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-170410-b41be5b/marvel-linux-amd64"
    sha256 "986b97676aacbc595a9a7ef72cbc6c16981d1d323450be1b3ccc463440585f5c"
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
