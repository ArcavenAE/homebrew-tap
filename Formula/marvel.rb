class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.232554.bc327df"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-232554-bc327df/marvel-darwin-arm64"
    sha256 "992db68c244fb06f133b89c7c6fd7b795b923913e6d284ae28ffe8491436f76a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-232554-bc327df/marvel-darwin-amd64"
    sha256 "44367a18b5c286153c3a7eb4afa8b185424fa697bb94a282a282ba230f6a019b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-232554-bc327df/marvel-linux-arm64"
    sha256 "5e3f7ddc295516c25a75d33d42adaf50bc5ce2a7ebd9b297e89d108cd1ec296d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-232554-bc327df/marvel-linux-amd64"
    sha256 "f2ebafe4fdcca1657f499e984b9bd95dfccdddac95f34e8c04d7b75f3f529b54"
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
