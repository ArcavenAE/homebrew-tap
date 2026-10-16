class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.150032.f819eaa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-150032-f819eaa/marvel-darwin-arm64"
    sha256 "df8facc8d442d203f7bf4f894025c84949941757757a9182f252277a113709ad"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-150032-f819eaa/marvel-darwin-amd64"
    sha256 "5a69d765fe0f3c1e73e4d757bbbe4c6225bb3bcce7c7fa860fee864d2ed52831"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-150032-f819eaa/marvel-linux-arm64"
    sha256 "0a9937ef8c0f77d876c15cbb8540edee6c3cc2ae093d858fba19e389a0dd5dc2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-150032-f819eaa/marvel-linux-amd64"
    sha256 "9970664413caa1a16e7ad40400cc6b4333e30b2ef2e11491f7fc681bbba205d7"
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
