class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.003404.5eb450d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-003404-5eb450d/marvel-darwin-arm64"
    sha256 "0a1a8e83072e1b91fa30d79997bd2cc538d66646d4508183e5352271cce22201"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-003404-5eb450d/marvel-darwin-amd64"
    sha256 "957ec4490aa283b827c377b6382203f664e0d72a3f78457edc70cb47824b9f8e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-003404-5eb450d/marvel-linux-arm64"
    sha256 "070579d98d66c0035b76358e6102d553f68e266ebe97b97826989b0d6af93d5b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-003404-5eb450d/marvel-linux-amd64"
    sha256 "ec400af7dcf3ca290a960d6eb7f7109b3bf48f4eb26f9ccbdd63120dfce388f3"
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
