class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.111858.03dd483"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111858-03dd483/marvel-darwin-arm64"
    sha256 "35dc5e4028d1e9e09f39bad2c5ffb6cbe3c5334b99701e26ff9a5c7c73f8fe7e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111858-03dd483/marvel-darwin-amd64"
    sha256 "10daa0311f42c09ddaada8bdec431e8dd626b250e99c4f8b8dd78bc963e1f84b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111858-03dd483/marvel-linux-arm64"
    sha256 "c5d9fe2fc289fdbd31c92daca95ddf976485770f620617ef90da1cffbdddb7d2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111858-03dd483/marvel-linux-amd64"
    sha256 "1270be0883394f2b5273a30143845d93ac68cdba76c2f6a7ca677a4034e12899"
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
