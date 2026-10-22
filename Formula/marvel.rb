class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.221436.f8bc13a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-221436-f8bc13a/marvel-darwin-arm64"
    sha256 "741c7775980b6c7cda7d26e239948370e8b5d7162d11cb53586de3a764b9f7d5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-221436-f8bc13a/marvel-darwin-amd64"
    sha256 "28be307918565403c92eebcc5046137dbfb3bbf5fe06fc0317dea24afee2d40e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-221436-f8bc13a/marvel-linux-arm64"
    sha256 "9e468d4f749ae18b22fc9d9cd9d833ae10c9f1721da96fb94c8580b941b600eb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-221436-f8bc13a/marvel-linux-amd64"
    sha256 "2ee824f6d14cb51cbfc85e0297cf5b7d9337100ad74a3a95d072e02af4b2279d"
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
