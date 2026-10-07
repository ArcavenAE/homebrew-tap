class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.040503.02451b1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-040504-02451b1/marvel-darwin-arm64"
    sha256 "404b40148b486fb15fd0263931cc7be70ade1b719247473c2d885d5600678177"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-040504-02451b1/marvel-darwin-amd64"
    sha256 "1ea9fdf2a28baabfd53e81b1d1f41433271e3e1bfa5f562387bc1b0d720aea59"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-040504-02451b1/marvel-linux-arm64"
    sha256 "55dc8445dd45e01f0383390c59b8301c3da2da6e84ee20c508d14deff22195c6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-040504-02451b1/marvel-linux-amd64"
    sha256 "ccf593990ea441ac1d0d08514e2224a6341f4ea1209e26090f6685546bd6d068"
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
