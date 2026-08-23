class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260823.211648.2f76ccf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-211648-2f76ccf/marvel-darwin-arm64"
    sha256 "01bf0723569a0f3ba2f60e675d75b0f5e65836db228757a7ab8bedf82a2e727d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-211648-2f76ccf/marvel-darwin-amd64"
    sha256 "6e0426920e406adfab8f2330a2263cc0b085930b087d736bf4b1ede95cc03862"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-211648-2f76ccf/marvel-linux-arm64"
    sha256 "e2cc8030dd3125897b92c3bf9341e8e49eff4a0d153fa5741f07d4398bb4123f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260823-211648-2f76ccf/marvel-linux-amd64"
    sha256 "4fd08b5b1224b4cf2f339b70af83cde2baac9edd1c78d87686728fc0f353a50b"
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
