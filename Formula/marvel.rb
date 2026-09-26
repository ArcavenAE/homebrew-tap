class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260926.000651.3e40f49"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-000651-3e40f49/marvel-darwin-arm64"
    sha256 "628b44489c6066f0b311c6f765c273ca047529e04388b08ebdb419a0f3a110da"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-000651-3e40f49/marvel-darwin-amd64"
    sha256 "71128d2f28ea49e63eb91203f34e6df1a94cf87ac8aa2cb9ca5f45c19fd792a6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-000651-3e40f49/marvel-linux-arm64"
    sha256 "993dfdf14c7be32dd9d8338a9d2006198e0a83af79680f12938bd796a81091c2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-000651-3e40f49/marvel-linux-amd64"
    sha256 "4c3a788262054c87bc57b769b4d72e80b1609ed3058916d7d2e76b74c5295fd9"
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
